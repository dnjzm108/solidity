// 제일먼저 버젼을 적어줘야한다. 
pragma solidity ^0.4.19;

//모든 코드가 contract 안에 싸여있어야 작동한다. 
contract ZombieFactory{
//변수는 블록체인안에 영구적으로 저장됨
//uint 는 음수가 아닌 정수만 쓸수있다.
uint dnaDigits = 16;
//지수 연산에서 ** 연승을 뜻한다 여기서 16 진수를 만들기위해 16연승으로한다.
uint dnaModuls = dnaDigits ** 16;

//구조체를 쓰기위해서는 struct 를 사용하면된다
sturct Zombie{
    //데이터타입 string은 앞에 string 이라고 달아주면되며 UTF-8데이터로 활용
    string name;
    uint dna;
}
//배열을 정적배열과 동적배열이 있는데 배열안에 숫자를 적으면 정적 비어있으면 동적배열이다.
 Zombie[] public zomvies;

//함수 선언 인자값에 데이터타입을 정해준다 인자값을 _ 언더바로 시작하는것은 전역변수와 구별하는것이 관례            
 //public 은 누구나 사용할수 있으면 함수를 만들면 자동으로 public 이며
 //private 함수로 만들때는 _를 넣는게 관례
 function _createZombie(string _name uint _dna) private{
     //배열에 새로운 좀비 추가 
     zomvies.push(Zomvie(_name,_dna));
   
 }
//view 는 어떤 값을 변경 & 무언가 쓰지않을경우
//pure 어떤 데이터도 접근하지 않을때
//return 받고싶은 데이터 타입을 넣어주면 된다. 
 function _generateRandomDna(string _str)private view returns(uint){
     uint rand = uint(keccak256(_str));
       return rand % dnaModulus;
 }
}