var number = 5;
var string = "Hello";
var sym = Symbol();
var bool = true;
null;
undefined;
var obj = {};

console.log(4/0);
console.log('4/0'*9);
let djopa;
console.log(djopa);
let person = {
    name: 'Igor',
    age: 36,
    sex: 'male'
};
console.log(person);
console.log(person.age, person.sex);

let arr = ['foo.jpg', 'boo.jpg', 'apple.bmp', person];
console.log(arr[0]);
console.log(arr);
console.log(arr.push('hui'));
console.log(arr);

// console.log(alert('Hello PIDR!'))

// let answer = confirm('Fuck you!')
// console.log(answer)

// let droch = prompt("Дрочишь?", "Yes-yes");
// console.log(droch)
// console.log(typeof(droch))

let incr = 10,
    decr = 10;

console.log(++incr, --decr);
console.log(incr++, decr--);

// if (prompt("Введи число, сука") == 8){
//     console.log('Correct!');
// } else {
//     console.log('Hui tebe a ne correct!');
// }
//
let numm = prompt('Число', 50);
// if(num < 49){
//     console.log('Мало!');
// } else if (num > 100) {
//     console.log('Много!');
// } else {
//     console.log('Норма');
// }
//
// (num == 60) ? console.log('Мало!'): console.log('Нормуль');

let num = 50;
switch (num) {
    case num < 50:
        console.log('Маловато!');
        break;

    case num > 100:
        console.log('Мнговато!');
        break;

    case 50:
        console.log('Ты даешь! Как угадал?');
        break;

}
