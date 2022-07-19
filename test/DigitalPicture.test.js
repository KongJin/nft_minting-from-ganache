const DigitalPicture = artifacts.require("DigitalPicture");

contract("DigitalPicture", async function (accounts) {
  const [owner] = accounts;

  beforeEach(async function () {
    //테스트실행전 실행되는 함수
    this.token = await DigitalPicture.new();
  });

  it("publish item", async function () {
    const tokenId = await this.token.publishItem(owner, "http://dev.sample.com/a/b/abc.jpg");
    console.log({ tokenId });
  });
});
