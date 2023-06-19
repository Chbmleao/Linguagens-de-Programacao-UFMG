val3(minorThan(X, Y), Context, Value) :-
  val3(X, Context, XValue),
  val3(Y, Context, YValue),
  (XValue < YValue -> Value is 1; Value is 0).

val3(plus(X, Y), Context, Value) :-
  val3(X, Context, XValue),
  val3(Y, Context, YValue),
  Value is XValue + YValue.

val3(minus(X, Y), Context, Value) :-
  val3(X, Context, XValue),
  val3(Y, Context, YValue),
  Value is XValue - YValue.

val3(times(X, Y), Context, Value) :-
  val3(X, Context, XValue),
  val3(Y, Context, YValue),
  Value is XValue * YValue.

val3(const(X), _, X).

val3(var(X), Context, Value) :-
  lookup(X, Context, Value).

val3(conditional(Cond, ThenBody, ElseBody), Context, Value) :-
  val3(Cond, Context, Boolean),
  (Boolean = 1 -> 
    val3(ThenBody, Context, Value)
  ;
    val3(ElseBody, Context, Value)
  ).

val3(let(X, Exp1, Exp2), Context, Value2) :-
  val3(Exp1, Context, Value1),
  val3(Exp2, [bind(X, Value1) | Context], Value2).

val3(fn(Formal, Body), Context, (fval(Formal, Body), Context)).

val3(fun(Var, Formal, Body), Context, (fval(Formal, Body), [bind(Var, fval(Formal, Body)) | Context])).


val3(apply(Function, Actual), Context, Value) :-
  val3(Function, Context, (fval(Formal, Body), NewContext)),
  val3(Actual, NewContext, ParamValue),
  val3(Body, [bind(Formal, ParamValue)|NewContext], Value).

lookup(Variable, [bind(Variable, Value)|_], Value).
lookup(VarX, [bind(VarY, _)|Rest], Value) :-
  VarX \= VarY, lookup(VarX, Rest, Value).

/*
   val3(let(y, const(1), let(y, const(2), var(y))), nil, X).
 
   val3(let(a, plus(const(3), const(4)), times(var(a), const(5))), nil, V).

   val3(apply(fn(x,times(var(x), var(x))), const(3)), nil, X).

   val3(let(x, const(1), let(f, fn(n, plus(var(n), var(x))), let(x, const(2), apply(var(f), const(0))))), nil, X).



  
 */

val3(let(
  fact, 
  fn(
    x, 
    conditional(
      minorThan(var(x), const(2)),
      var(x),
      times(
        var(x), 
        apply(
          var(fact), 
          minus(var(x), const(1))
        )
      )
    )
  ),
  apply(var(fact), const(5)) 
), [], Result).