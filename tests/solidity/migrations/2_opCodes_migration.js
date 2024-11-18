// Copyright 2019 The go-practeum Authors
// This file is part of the go-practeum library.
//
// The go-practeum library is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// The go-practeum library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with the go-practeum library. If not, see <http://www.gnu.org/licenses/>.

var OpCodes = artifacts.require("./OpCodes.sol");

module.exports = function(deployer) {
  deployer.deploy(OpCodes);
};
