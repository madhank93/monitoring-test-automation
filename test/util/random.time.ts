export default class RandomTime {
  static getRandomTime() {
    return new Promise<void>((resolve) =>
      setTimeout(resolve, Math.floor(Math.random() * 20000))
    );
  }
}
