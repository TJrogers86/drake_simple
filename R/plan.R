plan <- drake_plan(
  taxon_names = read.csv(file=file_in("data/taxa.csv"), stringsAsFactors=FALSE),
  tree.id = rotl::tnrs_match_names(taxon_names$Taxon[1])$ott_id,
  tree = rotl::tol_subtree(ott_id=tree.id, label_format = "name"),
  tree_resolution = paste0("It has ", ape::Nnode(tree), " nodes resolved of ",(ape::Ntip(tree)-1), " possible"),
  tree_print = plot_tree(tree, file=file_out("results/tree.pdf")),
  # Open Tree can also return the original studies with the source trees.
  trees = studies_find_trees(property="ot:ottTaxonName", value="Panthera", detailed=FALSE),
  studies.ids = unlist(trees$study_ids),
  study1.metadata = rotl::get_study_meta(studies.ids[1]),
  p = print(rotl::get_publication(study1.metadata)),
  study1.tree1 = get_study(studies.ids[1])[[1]],
  tree_print2 = plot_tree(study1.tree1, file=file_out("results/tree2.pdf"))
)

