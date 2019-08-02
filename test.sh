#!/bin/sh

#ajustar a árvore de trabalho mesclando a ramificação hot-fix
#e tente uma compilação

if  git-merge --no-commit hot-fix && make

then
    #executar um teste específico do projeto e relatar seu status
    ~/check_test_case.sh
    status=$?

else 
    
    #diga ao interlocutor que isso não é testável

    status=125
fi

# desfaça o tweak para permitir a inversão limpa para o próximo commit

git reset --hard

#sair

exit $status