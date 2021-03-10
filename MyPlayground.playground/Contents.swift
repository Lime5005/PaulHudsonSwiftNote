import UIKit

var str = "Hello, playground"
str = "Hi there!"
let Int = 3_000

//array: ordered
let John = "John Lion"
let Alice = "Alice Limbe"
let SHIP = "sheep"
let battles = [John, Alice, SHIP]

battles[1]

//set: unique values, no order
let colors = Set(["red", "blue", "yellow"])
let colors2 = Set(["red","red", "blue", "yellow"])

//tuples: fixed position, fixed value, may not be unique
var user = (user1: 8, user2: 9)
user.0
user.user2

//dictionaries: the key usually is a string, not accessible by position, but by key
let dict = ["Lily Rose": 20,"James Smith": 22]
dict["Lily Rose"]
dict["Boris Lolan", default: 99]

//How to create an empty array with types:
var arr1 = [String: String]()
var arr2 = [Int]
arr2[0] = 1



//How to create a set with types?
var set1 = Set<String>()

var set2 = Set<Int>()

//How to create Dictionary with types?
var dict10 = Dictionary<String, Int>()

enum Result {
    case Success
    case Failure
}
let result1 = Result.Success

enum Activity {
    case talking(topic: String)
    case writing(subject: Int)
}
let talk1 = Activity.talking(topic: "It's a beautiful world")
let write1 = Activity.writing(subject: 3)

enum Plant: String {
    case Rose = "flower"
    case brocoli = "legume"
    case meat = "is not plant"
}
let beaf = Plant(rawValue: "is not plant")

enum Candy: Int {
    case suger = 1
    case bobo
    case nono
}
let candy1 = Candy(rawValue: 3)


let capitals = ["England": "London", "Wales": "Cardiff"]
let scotlandCapital = capitals["Scotland"]

// swift is type safe language, no mix of types: you can't add an integer to a string
let int1 = 2
let int2 = 4
let int3 = int1 + int2

let str_a = "It's a nice "
let str_b = "day"
let str_total = str_a + str_b

// strings have a natural alphabetical order
"Taylor" <= "Swift"

//tenary operator
let first_card = 11
let second_card = 12
print(first_card > second_card ? "Yes" : "no")

let Weather = "sunny"
switch Weather {
case "rain":
    print("Bring the umbrella")
case "snow":
    print("Wear your coat")
case "sunny":
    print("Take your scarf")
default:
    print("Enjoy your day")
}

//range: ..< or ...
let score = 100
switch score {
case 0..<30:
    print("You failed")
case 30...80:
    print("You are close")
case 81..<100:
    print("You did OK")
default:
    print("You did great!")
}

// continue means skip the current one and continue: if
for i in 1...10 {
    if i % 2 == 1 {
        continue  //ignore this one and continue to loop on next number
    }

    print(i)
}

// page = 5 will run page 6:
var page: Int = 0
while page <= 5 {
    page += 1
    print("I'm reading page \(page).")
}

//when 12.5, that's the 4th time and it print something and continue as 12.5
var averageScore = 2.5
while averageScore < 15.0 {
    averageScore += 2.5
    print("The average score is \(averageScore)")
}

// when hoursStudied hits 5, it skips the loop forever
var hoursStudied = 0
var goal = 10
repeat {
    hoursStudied += 1
    if hoursStudied > 4 {
        goal -= 1
        continue //next one is still continue
    }
    print("I've studied for \(hoursStudied) hours")
} while hoursStudied < goal

// parameter labels: name for (outside inside: xxx)
func sayHello(to name: String) {
    print("Hello \(name)")
}
sayHello(to: "Lily")

//omitting parameter labels:
func greet(_ name: String) {
    print("Hi \(name)")
}
greet("Lily")

// default parameter:
func sayHi(_ name: String, nicely: Bool = true) {
    if nicely == true {
        print("Here comes \(name), Hi \(name)")
    } else {
        print("Oh no it's \(name) again")
    }
}
sayHi("Louis", nicely: false)
sayHi("Lily")

// variadic parameters: Int..., or String...
func square(_ numbers: Int...) {
    for number in numbers {
        print("\(number)'s square is \(number * number)")
    }
}
square(2, 3, 4)

// enum describes the errors we can throw
enum passwordError: Error {
    case tooObvious
}
func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw passwordError.tooObvious
    }
    return true
}
do {
    try checkPassword("password1")
    print("This password is good")
} catch {
    print("This is not a valid password")
}

//inout: reflect the original value outside the function, which can be changed, using & to recognise
func doubleNum(_ number: inout Int){ //inout: use the variable outside in
    number *= 2
}
var num1 = 10
doubleNum(&num1)

// closures as parameters, use a small function in another big function
let awesomeTalk = {
    print("That's fantastic!")
}
func deliverTalk(name: String, type: () -> Void) {
    print("My talk is called \(name)")
    type()
}
deliverTalk(name: "My awesome talk", type: awesomeTalk)
 
//Using closures as parameters when they return values
func bakeCookies(number: Int, secretIngredient: () -> String) {
    for _ in 0..<number {
        print("Adding butter...")
        print("Adding flour...")
        print("Adding sugar...")
        print("Adding egg...")
        let extra = secretIngredient()
        print(extra)
    }
}
bakeCookies(number: 1) {
    return "Adding vanilla extract powder"
}

//We don't use parameter names when calling a closure
//Closures cannot use external parameter labels.

// a closure is just like a named function, eg: var name = {func}, to call it using: name()
// How to add a parameter in a closure? put the parameters inside the {} and use a "in" keyword
var goToWalk = {(to: String) in
    print("I will go to have a walk in \(to)")
}
goToWalk("park")

// How to require a closure to have a return value? use "->"
var travel = {(place: String) -> String in
    return "I will go to traval in \(place)"
}
let goTravel = travel("London")
print(goTravel)

//put a closure like a parameter in a function:
let driving = {
    print("I'm driving to Grand Frais")
}

func goSomewhere(whichplace: () -> Void) {
    print("I planed to go to supermarket this weekend")
    whichplace()
    print("I'm arrived")
}
goSomewhere(whichplace: driving)

//How to use a closure freely as the last parameter of a function without a name: just use "{}"
// This is called Trailing closure syntax
func goToTravel(action: () -> Void) {
    print("I'm going to Tokyo")
    action()
    print("I like the food there")
}
goToTravel{
    print("I go there by plane")
}

// () -> Void means “accepts no parameters and returns nothing”
// How to use a trailing closure with a parameter: don't forget the "in" keyword
func travel(go: (String) -> Void) {
    print("I'm starting to leave")
    go("Japan")
    print("That would be great!")
}
travel { (place: String) in
    print("Yes, go to \(place)")
}

// How to return a value from a closure with a parameter:
func driveSomewhere(action: (String) -> String) {
    print("One")
    let getAction = action("Two")
    print(getAction)
    print("Three")
}
//driveSomewhere{(number: String)  -> String in
//    return "No. \(number)"
//}
// Using shorthand parameter names:
driveSomewhere{number in
    "Ok, this way comes the \(number)"
}
// or even better:
driveSomewhere{
    "Oh, \($0)"
}

//Return a closure from a function: the func has no params, and it returns a closure with parameters, and the closure returns nothing
func eatSomeFood() -> (String, String) -> Void {
    return {
        print("That's my favorite food: \($0), it's \($1)!")
    }
}
eatSomeFood()("orange", "sweet")

// Capture values: remember the value been used in the function
func favoriteFood() -> (String) -> Void {
    var counter = 1
    return {
        print("\(counter): I eat \($0) everyday!")
        counter += 1
    }
}
let food = favoriteFood() //must use in this way, otherwise the counter doesn't work
food("rice")
food("noodle")
food("rice")

func fixItem(item: String, costDollar: (Int) -> Void){
    print("I've fixed your \(item)")
    costDollar(450)
}
fixItem(item: "roof") {
    print("You charge this work for $\($0)? That's a lot!")
}

func runKidsParty(activities: ([String]) -> Void) {
    let kids = ["Bella", "India", "Lidia"]
    activities(kids)
}
runKidsParty{(names:[String]) in
    for name in names {
        print("Here is your bag \(name)")
    }
}

// Using different passwords for different function:
func passwordGenerator(password: String, using algorithm:(String) -> String){
    print("Encrypting password...")
    let result = algorithm(password)
    print("The result is: \(result)")
}
passwordGenerator(password: "newPassword") {
    return "Got the password is \($0)"
}
passwordGenerator(password: "SomeOne is waiting") {
    return "New password \($0)"
}

func scoreToGrade(score: Int, gradeMapping: (Int) -> String) {
    print("Your score was \(score)%.")
    let result = gradeMapping(score)
    print("That's a \(result).")
}
scoreToGrade(score: 90) {
    if $0 < 85 {
        return "Fail"
    } else {
        return "Success"
    }
}

func goShopping(for item: String, decisionHandler: (String) -> Bool) {
    print("I'm going to buy \(item)")
    if decisionHandler(item) == true {
        print("Great! I bought them.")
    } else {
        print("Maybe next time...")
    }
}
goShopping(for: "shoes") { item in
    if item == "shoes" {
        return false
    } else {
        return true
    }
}

func teachLesson(name: String, topic: () -> String) {
    print("Welcome to \(name).")
    print("Please take out your laptops and be quiet at the back.")
    let subject = topic()
    print(subject)
    print("See you tomorrow!")
}
teachLesson(name: "Swift 101") {
    return "Swift is a modern language that can be used to make apps on iOS and more."
}

// How to calculate how much money I win for interest in a bank?
func calculateInterest(start: Double, interest: () -> Double){
    print("You current balance is \(start)")
    let interestRate = interest()
    let result = start * interestRate
    print("You will get $\(result - start) a month for interest")
}
calculateInterest(start: 200.0) {
    return 1.01
}

func printGreeting(name: String, for usernameLoader: (String) -> String) {
    let username = usernameLoader(name)
    print("Hello, \(username)!")
}
printGreeting(name: "twostraws") {
    return $0
}

// How to calculate how much I used for this month by now?
func calculateCost() -> (Int) -> Void {
    var sum = 0
    return {
        sum += $0
        print("Now you have used \(sum)")
    }
}
let adder = calculateCost()
adder(60)
adder(80)

func translate(language: String) -> (String) -> String {
    return {
        if language == "French" {
            if $0 == "Hello" {
                return "Bonjour"
            } else {
                return "\($0) is unknown."
            }
        } else {
            return "Unknown language."
        }
    }
}
let translator = translate(language: "French")
let french = translator("Hello")
print(french)


struct City {
    var population: Int

    func collectTaxes() -> Int {
        return population * 1000
    }
}
let london = City(population: 9_000_000)
london.collectTaxes()

//change a var property in a struct
struct Person {
    var name: String
    mutating func changeName(){
        name = "Anonymous"
    }
}
var person = Person(name: "Joe")
person.changeName()
person.name

let string = "Do or not do, there is no try"
print(string.count)
print(string.sorted())

//array build-in function
var toys = ["winnie"]
toys.append("POU")
toys.firstIndex(of: "winnie")
print(toys.count)
print(toys.sorted())
toys.remove(at: 1)
print(toys.sorted())

//get an initializer:
struct User {
    var name: String
    init() {
        name = "Lime"
        print("A new user is created!")
    }
}

var user1 = User()
user1.name = "Lily"
print(user1.name)

// "lazy" makes the richGuy() struct run after, not before
struct richGuy {
    init(){
        print("This is a rich guy!")
    }
}

struct familyMember{
    var name: String
    lazy var isRich = richGuy()
    
    init(name: String) {
        self.name = name
        print("Name: \(name) is initialized!")
    }
}
var idiot = familyMember(name: "idiot")
print(idiot.isRich)

//static var: shared within all the same struct, private var: only accessible by a func inside the struct
struct Student {
    static var counter = 0
    private var id: String
    var name: String
    //a computed property: a value depends on other properties
    var studentsCount: String {
        if Student.counter > 0 {
            return "There has at least one student."
        } else {
            return "No student yet."
        }
    }
    init(name: String, id: String) {
        self.name = name
        self.id = id
        Student.counter += 1
    }
    
    func getId() -> String {
        return "The student's ID is \(id)"
    }
}
let student1 = Student(name: "Lilu", id: "123")
let student2 = Student(name: "Mac", id: "456")
print(Student.counter)
print(student1.name)
print(student1.getId())
print(student1.studentsCount)

//observe a property: the property must be var, not let
struct FishTank {
    var capacity: Int
    var fishCount: Int {
        didSet {
            if fishCount > capacity {
                print("You have too many fish!")
            }
        }
    }
}

struct Doctor {
    var name: String
    var location: String
    private var currentPatient = "No one"
    init(name: String, location: String) {
        self.name = name
        self.location = location
    }
    
    func getCurrentPatient() -> String{
        return currentPatient
    }
}
let drJones = Doctor(name: "Esther Jones", location: "Bristol")

drJones.getCurrentPatient()

// private property is accessible by "self" in init function
struct Office {
    private var passCode: String
    var address: String
    var employees: [String]
    init(address: String, employees: [String]) {
        self.address = address
        self.employees = employees
        self.passCode = "SEKRIT"
    }
}
let monmouthStreet = Office(address: "30 Monmouth St", employees: ["Paul Hudson"])
print(monmouthStreet)

//why is oK?
// init: all properties must have a value before the initializer ends.
struct School {
    var staffNames: [String]
    private var studentNames: [String]
    init(staff: String...) {
        self.staffNames = staff
        self.studentNames = [String]() //???
    }
}
let royalHigh = School(staff: "Mrs Hughes")

//static function:
struct Pokemon {
    static var numberCaught = 0
    var name: String
    static func catchPokemon() {
        print("Caught!")
        Pokemon.numberCaught += 1
    }
}

//access control:
struct FacebookUser {
    private var privatePosts: [String]
    public var publicPosts: [String]
//    init(publicPosts: [String]) {
//        self.publicPosts = publicPosts
//       self.privatePosts = ["private post"]
//    }
    
    func getPrivatePosts() -> [String]{
//        for privatePost in privatePosts {
//            return privatePost
//        }
        return privatePosts
    }
}
//var user1 = FacebookUser(publicPosts:["AAA"])

struct App {
    var name: String
    private var sales = 0
    init(name: String) {
        self.name = name
    }
}
let spotify = App(name: "Spotify")

// Difference between struct and class:
//class's copy will change the original class's property value
class Chef {
    var name = "Lime"
}
var chef1 = Chef()
chef1.name = "Lily"
var chef2 = chef1
chef2.name = "Justine"
print(chef1.name) // Justine

struct Singer {
    var name = "Song Zuying"
}
var singer1 = Singer(name: "Peng Liyuan")
var singer2 = singer1
singer2.name = "Fang"
print(singer1.name) //Peng Liyuan

//deinit func
class Staff {
    var name = "John Doe"
    init() {
        print("\(name) is coming!")
    }
    func Greeting() {
        print("Hello, \(name)!")
    }
    deinit {
        print("Bye, \(name)!")
    }
}
for _ in 1...3 {
    let staff = Staff()
    staff.Greeting()
}

class Starship {
    var maxWarp = 9.0
}
var voyager = Starship()
voyager.maxWarp = 9.975
var enterprise = voyager
enterprise.maxWarp = 9.6
print(voyager.maxWarp)
print(enterprise.maxWarp)

//(protocol) extentsion: forced to use some properties or functions:
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])
extension Collection {
    func summarize() {
        print("there are \(count) of us") // count property
        for name in self {  // a loop function
            print(name)
        }
    }
}
pythons.summarize()
beatles.summarize()

//protocol-oriented programming: give flexibility to extensions or functions
//protocol:  a var property must have a { get } or { get set } after it.
//Protocols specify what methods and properties conforming types must have.
// Protocols can not contain method implementations, only extensions can.
extension String {
    mutating func append(_ other: String) {
        self += other
    }
}
// this is return another value, not change the self:
extension Int {
    func cubed() -> Int {
        return self * self * self
    }
}

//optional
func isLongEnough(_ string: String?) -> Bool {
    guard let string = string else { return false }
    if string.count >= 8 {
        return true
    } else {
        return false
    }
}
if isLongEnough("Mario Odyssey") {
    print("Let's play that!")
}
//Let's play that!


func describe(occupation: String?) {
    guard let occupation = occupation else {
        print("You don't have a job.")
        return
    }
    print("You are an \(occupation).")
}
let job = "engineer"
describe(occupation: job)
//You are an engineer.

let painter: String? = "Leonardo da Vinci"
var artist: String = painter ?? "Unknown"

let songs: [String]? = [String]()
let finalSong = songs?.last?.uppercased()

// see if it's the same type, if yes, print something:
//class Bird {
//    var wingspan: Double? = nil
//}
//class Eagle: Bird { }
//let bird = Eagle()
//if let eagle = bird as? Eagle {
//    if let wingspan = eagle.wingspan {
//        print("The wingspan is \(wingspan).")
//    } else {
//        print("This bird has an unknown wingspan.")
//    }
//}

var longitude: Double
longitude = -86.783333
longitude = -186.783333
longitude = -1286.783333
longitude = -12386.783333
longitude = -123486.783333
longitude = -1234586.783333

var chansons: [Any] = ["Shake it Off", "You Belong with Me", "Back to December", 3]
var songs1: [String] = [] // same as: var songs1 = [String]()

var people = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]

for i in 0 ..< people.count {
    var str = "\(people[i]) gonna"

    for _ in 1 ... 5 {
        str += " \(actions[i])"
    }

    print(str)
}


func albumIsHers(name: String) -> Bool {
    //return false
    switch name {
    case "1":
        return true
    case "2":
        return true
    case "3":
        return true
    default:
        return false
    }
}
print(albumIsHers(name: "0")) //false

// Optional:
func getLoverStatus(weather: String) -> String? {
    if weather == "sunny" {
        return nil
    } else {
        return "Hate"
    }
}
var status: String?
status = getLoverStatus(weather: "rainy")

// How to unwrap an optional:
func getHaterStatus(weather: String) -> String? {
    if weather == "sunny" {
        return nil
    } else {
        return "Hate"
    }
}

func takeHaterAction(status: String) {
    if status == "Hate" {
        print("Hating")
    }
}

if let haterStatus = getHaterStatus(weather: "rainy") {
    takeHaterAction(status: haterStatus)
}

func albumReleased(year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    case 2010: return "Speak Now"
    case 2012: return "Red"
    case 2014: return "1989"
    default: return nil
    }
}

//let album = albumReleased(year: 2006)
//print("The album is \(album)") //not quite correct

//optional chaining: code after the ? will run ONLY if before it the code result is NOT nil
//let album = albumReleased(year: 2006)?.uppercased()
//print("The album is \(String(describing: album))")

//nil coalescing operator: ??
let album = albumReleased(year: 2006) ?? "unknown"
print("The album is \(album)")

//enum type and accordingly defined result:
enum fruitInSouth {
    case orange, apple(quantity: Int), citron, banane, grape
}
//
//func getOneFruitADay(fruit: fruitInSouth) -> String? {
//    if fruit == .citron {
//        return nil
//    } else {
//        return "Great, this is my favorite fruit!"
//    }
//}
//
//getOneFruitADay(fruit: .apple)
// the code above is the same as:
func getOneFruitADay(fruit: fruitInSouth) -> String? {
    switch fruit {
    case .apple(let quantity) where quantity > 1:
        return "OK"
    case .banane, .orange:
        return "Not bad"
    case .citron:
        return nil
    default:
        return "Great!"
    }
}
getOneFruitADay(fruit: .apple(quantity: 2)) //OK

//what is struct
struct Human {
    var clothes: String
    var shoes: String
}

let taylor = Human(clothes: "T-shirts", shoes: "sneakers")
let other = Human(clothes: "short skirts", shoes: "high heels")

var taylorCopy = taylor
taylorCopy.shoes = "flip flops"

print(taylor)  //Human(clothes: "T-shirts", shoes: "sneakers")
print(taylorCopy)  //Human(clothes: "T-shirts", shoes: "flip flops")

