// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract register {
  
  address[] _users;
  uint[] _passwords;

  mapping(address=>bool) _registered;

  function registerUser(address user, uint password) public {
    require(!_registered[user]);

    _registered[user]=true;
    _users.push(user);
    _passwords.push(password);
  }

  function loginUser(address user,uint password) public view returns(bool){
    require(_registered[user]);
    uint i=0;

    for(i=0;i<_users.length;i++){
      if(_users[i]==user && _passwords[i]==password){
        return true;
      }
    }
    return false;
  }

  function viewUsers() public view returns(address[] memory,uint[] memory){
    return (_users,_passwords);
  }

}
