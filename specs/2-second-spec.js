"use strict";

describe("Second spec", () => {
	it("does even funkier shit", () => {
		expect(true).to.equal(true);
	});
	
	it.skip("doesn't give a crap about running this test", () => {
		console.log("lol");
	});
	
	it("does hard math hurrr", () => {
		expect(50).to.be.above(2);
	});
});
