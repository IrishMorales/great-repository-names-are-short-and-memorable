"use strict";

const path = require("path");

before(async () => {
	await atom.packages.activatePackage(path.join(__dirname, ".."));
	expect(global).to.have.property("YOU_DID_IT");
	expect(global.YOU_DID_IT).to.equal("YIPPEE");
});

after(async () => {
	await atom.packages.deactivatePackage("SUCK-MY-RAGING-HARD-CAPS");
	expect(global).not.to.have.property("YOU_DID_IT");
});
