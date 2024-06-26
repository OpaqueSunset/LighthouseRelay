// (Re-)Apply mutations.
// TODO: Turn into a /mob proc, change inj to a bitflag for various forms of differing behavior.
// M: Mob to mess with
// connected: Machine we're in, type unchecked so I doubt it's used beyond monkeying
// flags: See below, bitfield.
#define MUTCHK_FORCED        1
/proc/domutcheck(var/mob/living/M, var/connected=null, var/flags=0)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(!H.should_have_organ(BP_HEART))
			return

	var/list/all_genes = decls_repository.get_decls_of_subtype(/decl/gene)
	for(var/gene_type in all_genes)
		var/decl/gene/gene = all_genes[gene_type]
		if(!M || !M.dna)
			return
		if(!gene.block)
			continue

		// Sanity checks, don't skip.
		if(!gene.can_activate(M,flags))
			//testing("[M] - Failed to activate [gene.name] (can_activate fail).")
			continue

		// Current state
		var/gene_active = (gene.flags & GENE_ALWAYS_ACTIVATE)
		if(!gene_active)
			gene_active = M.dna.GetSEState(gene.block)

		// Prior state
		var/gene_prior_status = (gene.type in M.active_genes)
		var/changed = gene_active != gene_prior_status || (gene.flags & GENE_ALWAYS_ACTIVATE)

		// If gene state has changed:
		if(changed)
			// Gene active (or ALWAYS ACTIVATE)
			if(gene_active || (gene.flags & GENE_ALWAYS_ACTIVATE))
				testing("[gene.name] activated!")
				gene.activate(M,connected,flags)
				if(M)
					LAZYDISTINCTADD(M.active_genes, gene.type)
					M.queue_icon_update()
			// If Gene is NOT active:
			else
				testing("[gene.name] deactivated!")
				gene.deactivate(M,connected,flags)
				if(M)
					LAZYREMOVE(M.active_genes, gene.type)
					M.queue_icon_update()
