# minify-maven-plugin 使用心得

## 适用场景

minify 插件的适用场景不多，webpack 等工具都能很好的替换掉 minify 的工作，如果你的项目恰好满足以下几个条件，你可以尝试使用 minify

1. 项目采用 maven 构建
1. 前后端代码没有分离
1. 有压缩/合并 js 和 css 的需求

另外该插件最后一次提交在 2016-11-30 目前基本停止维护，插件使用的 YUI 引擎也基本停止维护，建议使用 closure

## 插件配置

```
<plugin>
    <groupId>com.samaxes.maven</groupId>
    <artifactId>minify-maven-plugin</artifactId>
    <version>1.7.6</version>
    <executions>
        <execution>
            <id>default-minify</id>
            <phase>package</phase>
            <configuration>
                <charset>UTF-8</charset>
                <cssSourceDir>css</cssSourceDir>
                <cssIncludes>
                    <cssInclude>**</cssInclude>
                </cssIncludes>
                <cssExcludes>
                    <exclude>lib/**</exclude>
                </cssExcludes>
                <jsSourceDir>js</jsSourceDir>
                <jsIncludes>
                    <jsInclude>**</jsInclude>
                </jsIncludes>
                <jsExcludes>
                    <jsExclude>lib/**</jsExclude>
                </jsExcludes>
                <jsEngine>CLOSURE</jsEngine>
                <nosuffix>true</nosuffix>
                <skipMerge>true</skipMerge>
                <verbose>true</verbose>
            </configuration>
            <goals>
                <goal>minify</goal>
            </goals>
        </execution>
    </executions>
</plugin>
```

## 参数含义

|属性|描述|
--|--|--
|charset|指定字符类型，默认值 `${project.build.sourceEncoding}`|
|webappSourceDir|webapp 文件夹地址，默认 `${basedir}/src/main/webapp`|
|webappTargetDir|默认 `${project.build.directory}/${project.build.finalName}`|
|cssSourceDir|css 文件夹，默认 css|
|cssFiles|需要处理的 css 文件列表|
|cssIncludes|css 文件集表达式，扫描 cssSourceDir 下需要处理的 css 文件，例如 `**/*.css`|
|cssExcludes|同上，用于过滤不需要处理的 css 文件，例如 `**/*.min.css`|
|cssTargetDir|生成的 css 文件所在文件夹，默认与 cssSourceDir 相同|
|cssEngine|压缩/合并 css 使用的引擎，固定为 YUI|
|cssFinalFile|css 输出文件名字，默认 style.css|
|jsSourceDir|js 文件夹，默认 js|
|jsFiles|需要处理的 js 文件列表|
|jsIncludes|js 文件集表达式，扫描 jsSourceDir 下需要处理的 js 文件，例如 `**/*.js`|
|jsExcludes|同上，用于过滤不需要处理的 js 文件，例如 `**/*.min.js`|
|jsTargetDir|生成的 js 文件所在文件夹，默认与 jsSourceDir 相同|
|jsEngine|压缩/合并 js 使用的引擎，YUI or CLOSURE 默认 YUI|
|jsFinalFile|js 输出文件名字，默认 script.js|
|nosuffix|不使用后缀，默认 false|
|skipMerge|跳过合并，默认 false|
|skipMinify|跳过压缩，默认 false|
|verbose|展示附加信息和警告，默认 false|
|yuiLineBreak|默认 -1 |
|yuiNoMunge|默认 false|
|yuiPreserveSemicolons|默认 false|
|yuiDisableOptimizations|默认 false|
|closureLanguageIn||
|closureLanguageOut||
|closureEnvironment||
|closureCompilationLevel|压缩率从小到大 WHITESPACE_ONLY, SIMPLE_OPTIMIZATIONS(默认), ADVANCED_OPTIMIZATIONS。  [更多介绍](https://developers.google.com/closure/compiler/docs/compilation_levels)|
|closureExterns|ADVANCED_OPTIMIZATIONS 下生效，用于调用第三方方法时不压缩方法名，将方法名定义在文件中传给 closure 引擎。 [更多介绍在 Declaring Externs 章节](https://developers.google.com/closure/compiler/docs/api-tutorial3) |
|closureCreateSourceMap||
|closureSortDependencies||
|closureWarningLevels||
|closureAngularPass||
|closureExtraAnnotations||
|closureDefine||

参考文档
+ [minify-maven-plugin](https://github.com/samaxes/minify-maven-plugin)
+ [YUI](https://github.com/yui/yuicompressor)
+ [closure](https://github.com/google/closure-compiler)

<p style="text-align: center"><a href="/">回首页</a></p>
 
<p align="right">21/11/2018</p>