(add-to-list 'load-path "~/.emacs.d/vendor/jdee/lisp")

;; Start JDE when Emacs is started?
(setq defer-loading-jde t)

(setq
 jde-bug-debugger-host-address "127.0.0.1"
 jde-bug-jre-home "/usr/lib/jvm/java-6-openjdk-amd64"
 jde-compile-option-debug (quote ("all" (t nil nil)))
 jde-debugger (quote ("jdb"))
 jde-global-classpath (quote ("." "/usr/share/java/" "/usr/lib/jvm/java-6-openjdk-amd64/"))
 jde-jdk-doc-url "/usr/share/doc/openjdk-6-doc/html/api/index.html"
 jde-jdk-registry (quote (("1.6" . "/usr/lib/jvm/java-6-openjdk-amd64")))
 jde-jdk (quote ("1.6"))
 jde-regexp-jar-file "/usr/share/java/regexp.jar"
 jde-sourcepath (quote ("."))
 jde-junit-testrunner-type "org.junit.runner.JUnitCore"

 ;; Sometimes JDEE prints useful messages, but if everything works
 ;; well you will not be using this.
 jde-log-max 5000

 ;; Completes if conditions.
 jde-enable-abbrev-mode t

 ;; For syntax highlighting and basic syntax checking parse buffer
 ;; number of seconds from the time you changed the buffer
 jde-auto-parse-buffer-interval 600)

(if defer-loading-jde
    (progn
      (autoload 'jde-mode "jde" "JDE mode." t)
      (setq auto-mode-alist
            (append
             '(("\\.java\\'" . jde-mode))
             auto-mode-alist)))
  (require 'jde)
  (require 'jde-eclipse-compiler-server)
  (require 'flymake))

;; Understanding compiler output
(require 'compile)

(setq compilation-error-regexp-alist
      (append (list
               ;; works for jikes
               '("^\\s-*\\[[^]]*\\]\\s-*\\(.+\\):\\([0-9]+\\):\\([0-9]+\\):[0-9]+:[0-9]+:" 1 2 3)
               ;; works for javac
               '("^\\s-*\\[[^]]*\\]\\s-*\\(.+\\):\\([0-9]+\\):" 1 2)
               ;; works for maven 2.x
               '("^\\(.*\\):\\[\\([0-9]*\\),\\([0-9]*\\)\\]" 1 2 3)
               ;; works for maven 3.x
               '("^\\(\\[ERROR\\] \\)?\\(/[^:]+\\):\\[\\([0-9]+\\),\\([0-9]+\\)\\]" 2 3 4))
              compilation-error-regexp-alist))

(setq jde-sourcepath '("./src"))
(setq jde-lib-directory-names '("^lib"))
(setq jde-global-classpath '("./lib/commons-exec-1.1.jar"
                             "./lib/commons-jxpath-1.3.jar"
                             "./lib/gson-2.2.jar"
                             "./lib/guava-12.0.jar"
                             "./lib/ini4j-0.5.2.jar"
                             "./lib/junit-4.10.jar"
                             "./lib/netty-3.2.7.Final.jar"
                             "./lib/operalaunchers-0.8.jar"
                             "./protobuf-java-2.4.1.jar"
                             "./lib/selenium-java-2.21.0.jar"
                             "./lib/servlet-api-2.5-6.1.9.jar"
                             "./lib/servlet-api.jar"
                             "./lib/sonar-ant-task-1.3.jar"
                             "./lib/webbit-0.4.8-SNAPSHOT.jar"))

(provide 'setup-jde)