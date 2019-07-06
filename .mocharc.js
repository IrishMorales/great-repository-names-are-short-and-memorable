"use strict";

module.exports = {
	beforeFinish(failures){
		expect(global.DID_LOAD).to.equal(true);
		return failures;
	},
};
