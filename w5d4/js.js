function madLib(verb, adj, noun) {
  console.log("We shall " + verb.toUpperCase() +" the " +
  adj.toUpperCase() + " " + noun.toUpperCase() + ".");
}

function isSubstring(searchSubstring, subString) {
  return searchSubstring.includes(subString);
}

function fizzBuzz(array) {
  var result = []
  for (let i = 0; i < array.length; i++) {
    if (array[i] % 3 == 0 || array[i] % 5 == 0) {
      result.push(array[i])
    }
  }
  return result
}

function isPrime(number) {
  for (let i = 2; i < number; i ++) {
    if (number % i == 0) {
      return false
    }
  }
  return true;
}

function firstNPrimes(num) {
  var result = []
  var i = 2
  while (result.length < num) {
    if (isPrime(i)) {
      result.push(i)
    }
    i += 1
  }
  return result
}

function sumOfNPrimes(n) {
  var primesArray = firstNPrimes(n)
  var result = 0
  for (let i = 0; i < primesArray.length; i++) {
    result += primesArray[i]
  }
  return result
}
