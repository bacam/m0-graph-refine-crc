(*
 * Copyright 2015, NICTA
 *
 * This software may be distributed and modified according to the terms of
 * the BSD 2-Clause license. Note that NO WARRANTY is provided.
 * See "LICENSE_BSD2.txt" for details.
 *
 * @TAG(NICTA_BSD)
*)

theory CRC

imports CTranslation
  "/home/bcampbe2/sel4/verification/l4v/tools/asmrefine/SimplExport"
  "/home/bcampbe2/sel4/verification/l4v/tools/asmrefine/ProveGraphRefine"

begin

install_C_file "crc.c"

ML {*
val csenv = let
    val the_csenv = CalculateState.get_csenv @{theory} "crc.c" |> the
  in fn () => the_csenv end
*}

setup {* DefineGlobalsList.define_globals_list_i "crc.c" @{typ globals} *}

lemmas global_data_defs = crc_global_addresses.global_data_defs

context crc_global_addresses begin

ML {* let val outfile = openOut_relative @{theory} "crc_C_graph.txt" in
  emit_C_everything @{context} (csenv ()) outfile;
  TextIO.closeOut outfile
  end
*}

end 

(*
context insertsort begin

ML {*

val funs = ParseGraph.funs @{theory} "CFunDump.txt"
val funs = Symtab.delete "CRC.main" funs
(*val funs' = filter (fn (name,_) => name <> "CRC.main") funs*)
;

ProveSimplToGraphGoals.test_graph_refine_proof_with_def funs (csenv ()) @{context} "CRC.sort2"
(*ProveSimplToGraphGoals.test_all_graph_refine_proofs_after funs (csenv ()) @{context} NONE*)



*}
end
*)
end

