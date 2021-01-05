pragma solidity ^0.7.4;

// openaeppelenin-solidityファイルを読み込む
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

// Roomコントラクト
contract Room is Ownable {

    // デプロイ用コンストラクター
    // @param _creator ルーム作成者のアドレス
    constructor(address _creator) {
        owner = _creator;
    }

    // 預金をRoomコントラクトへ送金する関数
    // 送金を可能とするためにpayable修飾子をつける
    function deposit() external payable {}

    // 報酬をRoomコントラクトへ送金する関数
    // @param _reward 報酬
    // @param _dest 投稿者のアドレス
    function sendReward(uint256 _reward, address _dest) external onlyOwner{
        _dest.transfer(_reward);
    }

    // コントラクトで余ったetherをオーナーへ返金する関数
    function refundToOwner() external onlyOwner {
        owner.transfer(address(this).balance);
    }
}
