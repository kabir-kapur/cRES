pragma solidity 0.8.7;

contract Oracle{
    request[] requests; 

    struct request{
        string url;
        string attribute;
        uint price;
        string symbol;
    }

    event Request(request);

    function requestRequest(string memory _urlToQuery, string memory _attributeToFetch) public {
        request memory send = request("beast.com", "price of beast today", 0, "null");
        emit Request(send);
    }
}