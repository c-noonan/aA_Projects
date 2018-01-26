// class Clock {
//   constructor() {
//     let date = new Date();
//     const tick = this._tick.bind(this);
//     this.hours = date.getHours();
//     this.minutes = date.getMinutes();
//     this.seconds = date.getSeconds();
//     this.printTime();
//     setInterval(tick, 1000);
//   }
//
//   printTime () {
//     console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
//   }
//
//   _tick() {
//     this.seconds++;
//     if (this.seconds === 60) {
//       this.seconds = 0;
//       this.minutes++;
//     }
//     if (this.minutes === 60) {
//       this.minutes = 0;
//       this.hours++;
//     }
//     if (this.hours === 24) {
//       this.hours = 0;
//     }
//     this.printTime();
//   }
// }
//
// const clock = new Clock();

//
//
// const readline = require('readline');
//
// const reader = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout
// });

// function addNumbers(sum, numsLeft, completionCallback) {
//   let sumNum = sum;
//
//   if (numsLeft === 0) {
//     reader.close();
//     return completionCallback(sumNum);
//   }
//
//   reader.question('Pick a number:', function(answer) {
//     let num = parseInt(answer);
//     sumNum += num;
//     numsLeft--;
//     console.log(`Sum is now: ${sumNum}`);
//     return addNumbers(sumNum, numsLeft, completionCallback);
//   });
//
// }
//
// addNumbers(5, 10, sum => console.log(`Total Sum: ${sum}`));

//
//
// function askIfGreaterThan(el1, el2, callback) {
//   // Prompt user to tell us whether el1 > el2; pass true back to the
//   // callback if true; else false.
//   reader.question (`Is ${el1} > ${el2}?`, function(answer) {
//     if (answer === 'yes') {
//       callback(true);
//     } else {
//       callback(false);
//     }
//   });
// }
//
// // Once you're done testing askIfGreaterThan with dummy arguments, write this.
// function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
//   // Do an "async loop":
//   // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
//   //    know whether any swap was made.
//   // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +
//   //    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
//   //    continue the inner loop. You'll want to increment i for the
//   //    next call, and possibly switch madeAnySwaps if you did swap.
//   if (i === arr.length - 1) {
//     return outerBubbleSortLoop(madeAnySwaps);
//   } else {
//     askIfGreaterThan(arr[i], arr[i+1], function(isGreaterThan) {
//       if (isGreaterThan) {
//         [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
//         madeAnySwaps = true;
//       }
//
//       innerBubbleSortLoop(
//         arr, i + 1, madeAnySwaps, outerBubbleSortLoop
//       );
//     });
//   }
// }
//
// // Once you're done testing innerBubbleSortLoop, write outerBubbleSortLoop.
// // Once you're done testing outerBubbleSortLoop, write absurdBubbleSort.
//
// function absurdBubbleSort(arr, sortCompletionCallback) {
//   function outerBubbleSortLoop(madeAnySwaps) {
//     if (madeAnySwaps) {
//       innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
//     } else {
//       sortCompletionCallback(arr);
//     }
//     // Begin an inner loop if you made any swaps. Otherwise, call
//     // `sortCompletionCallback`.
//   }
//   // Kick the first outer loop off, starting `madeAnySwaps` as true.
//   outerBubbleSortLoop(true);
// }
//
// absurdBubbleSort([3, 5, 18, 37, 2, 6, 48, 1, 1], function (arr) {
//   console.log("Sorted array: " + JSON.stringify(arr));
//   reader.close();
// });

Function.prototype.myBind = function(context) {
  return () => this.apply(context);
};

class Lamp {
  constructor() {
    this.name = "a lamp";
  }
}

const turnOn = function() {
   console.log("Turning on " + this.name);
};

const lamp = new Lamp();

// turnOn(); // should not work the way we want it to

const boundTurnOn = turnOn.bind(lamp);
const myBoundTurnOn = turnOn.myBind(lamp);

boundTurnOn(); // should say "Turning on a lamp"
myBoundTurnOn(); // should say "Turning on a lamp"
