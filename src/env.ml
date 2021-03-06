type access
type enventry =
    VarEntry of Translate.access * Types.t
  | FunEntry of Translate.level * Temp.label * Types.t list * Types.t

let base_tenv =
  Symbol.enter (Symbol.symbol "int") Types.INT
  @@ Symbol.enter (Symbol.symbol "string") Types.STRING
  @@ Symbol.empty

let base_venv =
  Symbol.enter (Symbol.symbol "print") (FunEntry (Translate.outermost, Temp.named_label "print", [Types.STRING], Types.UNIT))
  @@ Symbol.enter (Symbol.symbol "flush") (FunEntry (Translate.outermost, Temp.named_label "flush", [], Types.UNIT))
  @@ Symbol.enter (Symbol.symbol "ord") (FunEntry (Translate.outermost, Temp.named_label "ord", [Types.STRING], Types.INT))
  @@ Symbol.enter (Symbol.symbol "chr") (FunEntry (Translate.outermost, Temp.named_label "chr", [Types.INT], Types.STRING))
  @@ Symbol.enter (Symbol.symbol "size") (FunEntry (Translate.outermost, Temp.named_label "size", [Types.STRING], Types.INT))
  @@ Symbol.enter (Symbol.symbol "getchar") (FunEntry (Translate.outermost, Temp.named_label "getchar", [], Types.STRING))
  @@ Symbol.enter (Symbol.symbol "substring") (FunEntry (Translate.outermost, Temp.named_label "substring", [Types.STRING; Types.INT; Types.INT], Types.STRING))
  @@ Symbol.enter (Symbol.symbol "concat") (FunEntry (Translate.outermost, Temp.named_label "concat", [Types.STRING; Types.STRING], Types.STRING))
  @@ Symbol.enter (Symbol.symbol "not") (FunEntry (Translate.outermost, Temp.named_label "_not", [Types.INT], Types.INT))
  @@ Symbol.enter (Symbol.symbol "exit") (FunEntry (Translate.outermost, Temp.named_label "exit", [Types.INT], Types.UNIT))
  @@ Symbol.empty
