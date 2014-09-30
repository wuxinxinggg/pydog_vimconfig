vim-config
==========
###是什么?###

这是我的vim配置，当然，如果喜欢可以你可以随意拿去。(^_^)

###怎么用？###

最简单的方法就是clone所有的配置到你的`.vim`目录之中，首先交代下我的vim配置方法，与vim相关的配置主要是`.vim`里的插件，一般目录位于`~/.vim`，还有vim的配置文件`~/.vimrc`，为了让配置vim更简单些，利用了`ln -s  ~/.vim/.vimrc ~/.vimrc`命令，这样，就相当于`～/.vimrc`是一个指向`~/.vim/.vimrc`的快捷方式。因此使用我的配置，也很简单。

第一步:备份。
```
mv ~/.vim backup
mv ~/.vimrc backup
```
第二步:复制配置。
```
git clone git@github.com:wuxinxinggg/pydog_vimconfig.git .vim
cd ~/.vim
git submodule init     #执行初始化子模块
git submodule update   #更新子模块
```  
第三步:创建.vimrc链接

`ln -s ~/.vim/.vimrc ~/.vimrc`
        
最后，Enjoy it!
