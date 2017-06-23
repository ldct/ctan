(TeX-add-style-hook "rtsched"
 (lambda ()
    (LaTeX-add-environments
     "RTGrid")
    (TeX-add-symbols
     '("TaskRespTime" ["argument"] 3)
     '("TaskExecDelta" ["argument"] 3)
     '("RowLabel" ["argument"] 2)
     '("RTBox" ["argument"] 2)
     '("Activation" ["argument"] 4)
     '("Inherit" ["argument"] 3)
     '("Label" ["argument"] 3)
     '("TaskUnlock" ["argument"] 3)
     '("TaskLock" ["argument"] 3)
     '("TaskExecution" ["argument"] 3)
     '("TaskDeadline" ["argument"] 2)
     '("TaskArrDead" ["argument"] 3)
     '("TaskArrival" ["argument"] 2)
     '("RTSet" 1)
     "sx"
     "sy"
     "hy"
     "xx"
     "yy"
     "xxx"
     "yyy"
     "nsx"
     "nsy"
     "nhl"
     "nvl"
     "tmp"
     "RTSetDefault"
     "RTNullWindowHeight"
     "RTDefTaskSymbol"
     "RTDefNumberOffset"
     "RTDefTaskFill"
     "RTDefTaskColor"
     "RTDefLineColor"
     "RTDefXScale"
     "RTDefWriteSymbols"
     "RTDefGridInvisible"
     "RTDefNumbersInvisible"
     "RTDefRowLabelOffset"
     "RTWindowHeight"
     "RTWindowLength"
     "RTTaskLabelSize"
     "RTNumberLabelSize"
     "RTTaskColor"
     "RTLineColor"
     "RTExecLabel"
     "RTTaskFill"
     "RTXScale"
     "RTTaskSymbol"
     "RTWriteSymbols"
     "RTNumberOffset"
     "RTGridInvisible"
     "RTNumbersInvisible"
     "RTRowLabelOffset"
     "RTGridBegin"
     "RTGridEnd")
    (TeX-run-style-hooks
     "keyval"
     "pstricks"
     "multido")))

