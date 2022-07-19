pragma solidity >=0.4.22 <0.9.0; //현재 작성하는 버전

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";//클래스 느낌으로 씀

import "@openzeppelin/contracts/utils/Counters.sol";//nft토큰마다의 고유 주소값을 순번처리 하는 라이브러리

contract DigitalPicture is ERC721URIStorage{
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    //유틸에잇는 카운터스점카운터를 DigitalPicture안에서만 쓸수있는 토큰아이디스라는 변수에 저장하겟다
    constructor() ERC721("DigitPicture","NDP"){}
    //웹3.js 에선 퍼블릭으로 정의된것만 이용가능
    function publishItem(address creator , string memory tokenURI) public returns (uint256){
        _tokenIds.increment();
        uint256 newTokenId= _tokenIds.current(); //현재값 
    //uint 256는 숫자 최대크기 가질수잇음
        _mint(creator, newTokenId);
        //민트라는 함수가 원작자의 정보를 nft토큰에 새기고 발급함
        _setTokenURI(newTokenId, tokenURI);
        //토큰ID와 창작자의 그림이 보관된 위치를 매핑 
        return newTokenId;
    }
    
}