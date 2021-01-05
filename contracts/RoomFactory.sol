pragma solidity ^0.7.4;

// Room.solファイルを読み込む
import "./Room.sol";

//RoomFactoryコントラクト
contract RoomFactory {

    //Roomコントラクトのコンストラクターを実行する関数
    function createRoom() external payable {
        // Roomコントラクトを指定してEthereumネットワークにコンストラクターをデプロイする
        address newRoom = (new Room).value(msg.value)(msg.sender);
    }
}