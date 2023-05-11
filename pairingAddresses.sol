/* Your assignment is to build out the rest of the contract functionality. 
Create a Contract, using nested mapping, to pair two contract addresses together 
(an address owner and an address spender) with a value of integers to keep track of their index.

One you have successfully set up the map, add additional contract functionality 
so that the contract can pair up new addresses together (owner and spender) as well as retrieve their mapping value.
 */
 
contract allowance {
    mapping (address => uint) owner;
    mapping (address => mapping (address => uint)) spender;

    function pairup(uint _id, address _addrOwner, address _addrSpender) public {
        spender[_addrOwner][_addrSpender] = _id;
    }
    
    function getpairup(address _addrOwner, address _addrSpender) public view returns(uint){
        return spender[_addrOwner][_addrSpender];
    }
 
    //this function removes the spenders allowance
   
    function remove(address _addrOwner, address _addrSpender) public {
        delete spender[_addrOwner][_addrSpender];
    }
}
