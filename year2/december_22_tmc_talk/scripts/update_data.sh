rsync -r arpit@192.168.1.65:/home2/arpit/repositories/dissertation/year1/figures/* ../figures/
rsync -r arpit@192.168.1.65:/home2/arpit/repositories/worktrees/ader_worktree/ader/equivalence_data/*pdf ../figures/equivalence_ader/
bash pdfbb ../figures/*/*.pdf
