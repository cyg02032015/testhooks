#!/bin/sh

# 设置 pre-push 钩子
echo '#!/bin/sh' > .git/hooks/pre-push 
echo '' >> .git/hooks/pre-push
echo 'changes=$(git diff --name-only HEAD HEAD^)' >> .git/hooks/pre-push
echo 'if echo "$changes" | grep "test.txt"' >> .git/hooks/pre-push  
echo 'then' >> .git/hooks/pre-push
echo '    echo "test.txt has changed"' >> .git/hooks/pre-push  
echo 'fi' >> .git/hooks/pre-push
chmod +x .git/hooks/pre-push

# 设置 post-merge 钩子 
echo '#!/bin/sh' > .git/hooks/post-merge
echo '' >> .git/hooks/post-merge
echo 'changes=$(git diff origin/master...HEAD --name-only test.txt)' >> .git/hooks/post-merge  
echo 'if [ -n "$changes" ]' >>  .git/hooks/post-merge
echo 'then' >> .git/hooks/post-merge  
echo '    echo "test.txt has changed"' >> .git/hooks/post-merge
echo 'fi' >> .git/hooks/post-merge
chmod +x .git/hooks/post-merge