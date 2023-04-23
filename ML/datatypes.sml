datatype suit = Hearts | Clubs | Diamonds | Spades;

fun suitname Hearts = "Hearts"
 |  suitname Clubs = "Clubs"
 |  suitname Diamonds = "Diamonds"
 |  suitname Spades = "Spades";
suitname Hearts;


datatype number = ValueInt of int | ValueReal of real;

fun plus (ValueInt x) (ValueInt y) = ValueInt (x + y)
 |  plus (ValueReal x) (ValueReal y) = ValueReal (x + y)
 |  plus (ValueInt x) (ValueReal y) = ValueReal (Real.fromInt(x) + y)
 |  plus (ValueReal x) (ValueInt y) = ValueReal (x + Real.fromInt(y));
plus (ValueInt 1) (ValueInt 2);
plus (ValueReal 3.0) (ValueReal 4.0);
plus (ValueInt 5) (ValueReal 6.0);
plus (ValueReal 7.0) (ValueInt 8);


datatype intnest = INT of int | LIST of intnest list;

fun addUp (INT x) = x
 |  addUp (LIST nil) = 0
 |  addUp (LIST (h::t)) = addUp h + addUp (LIST t);
addUp (LIST [(INT 1), (INT 2), (LIST [(INT 4)])]);


datatype 'element mylist = NIL | CONS of 'element * 'element mylist;

fun prod NIL = 1
 |  prod (CONS (x, list)) = x * prod list;
prod (CONS (2, (CONS (2, NIL))));
prod (CONS (2, CONS(3, (CONS (2, NIL)))));

fun reverse list =
    let 
        fun rev (NIL, acc) = acc
         |  rev (CONS (n, rest), acc) = rev (rest, CONS(n, acc))
    in
        rev (list, NIL)
    end;
reverse (CONS (5, CONS(3, (CONS (2, NIL)))));

fun append NIL NIL = NIL
 |  append NIL list = list
 |  append list NIL = list
 |  append (CONS (x, restA)) listB = CONS(x, append restA listB);  
append (CONS (5, CONS(3, (CONS (2, NIL))))) (CONS (5, CONS(3, (CONS (1, NIL)))));


datatype 'data tree = Empty | Node of 'data tree * 'data * 'data tree;

fun revTree Empty = Empty
 |  revTree (Node (left, e, right)) = Node (revTree right, e, revTree left); 
revTree (Node(Node(Empty, 1, Empty), 2, Node(Empty, 3, Empty)));

fun appendall Empty = nil
 |  appendall (Node (left, e, right)) = appendall(left) @ e @ appendall(right);
appendall (Node(Node(Node(Empty, [1], Empty), [2], Node(Empty, [3], Empty)), [4], Node(Node(Empty, [5], Empty), [6], Node(Empty, [7], Empty))));

fun isComplete Empty = true 
 |  isComplete (Node(Empty, e, Node(_))) = false
 |  isComplete (Node(Node(_), e, Empty)) = false
 |  isComplete (Node(n1, e, n2)) = isComplete(n1) andalso isComplete(n2);
isComplete (Node(Empty, 3, Empty));
isComplete (Node(Node(Empty, 4, Empty), 3, Empty));
isComplete (Node(Node(Empty, 1, Empty), 2, Node(Empty, 3, Node(Empty, 4, Empty))));
isComplete (Node(Node(Empty, 4, Empty), 3, Node(Empty, 3, Empty)));

fun makeBST nil _ = Empty
 |  makeBST (h::t) comp =
    let
        val bigs = List.filter (fn(item) => comp(item, h)) t
        val smalls = List.filter (fn(item) => not(comp(item, h))) t
    in 
        (Node(makeBST smalls comp, h, makeBST bigs comp))
    end;
makeBST [1,2,3] (fn(a,b) => a>b);
makeBST [2,1,3] (fn(a,b) => a>b);
makeBST [5,1,6,2,7] (fn(a,b) => a>b);

fun searchBST Empty _ _ = false
 |  searchBST (Node(left, curr, right)) comp item = 
    if curr = item
    then true
    else
        if comp(item, curr)
        then searchBST right comp item
        else searchBST left comp item;
val x = makeBST [5,1,6,2,7] (fn(a,b) => a>b);;
searchBST x (fn(a,b) => a>b) 7;
searchBST x (fn(a,b) => a>b) 8;


datatype exp =  
    NUM of int |
    SUM of exp * exp |
    MUL of exp * exp |
    UNMINUS of exp;

fun interpret (NUM x) = x
 |  interpret (SUM (x, y)) = interpret(x) + interpret(y)
 |  interpret (MUL (x, y)) = interpret(x) * interpret(y)
 |  interpret (UNMINUS x) = (~1) * interpret(x);
val x =  SUM((MUL (NUM 2, NUM 3)), SUM(UNMINUS (NUM 3), NUM 5));
interpret x;
val x =  MUL((MUL (NUM 3, NUM 3)), SUM(UNMINUS (NUM 3), NUM 5));
interpret x;
   
