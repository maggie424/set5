// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Shopping {

    struct Product {
        uint id;
        string name;
        uint price;
    }

    mapping(uint => Product) public products;
    uint public productCount;

    constructor() {
        addProduct("Laptop", 50000);
        addProduct("Mobile", 20000);
        addProduct("Headphones", 2000);
    }

    function addProduct(string memory _name, uint _price) public {
        productCount++;

        products[productCount] = Product(
            productCount,
            _name,
            _price
        );
    }

    function buyProduct(uint _id) public payable {
        require(_id > 0 && _id <= productCount,
        "Invalid product");

        require(msg.value >= products[_id].price,
        "Insufficient payment");
    }

    function getProduct(uint _id)
        public view returns (uint, string memory, uint) {

        Product memory p = products[_id];

        return (p.id, p.name, p.price);
    }
}
