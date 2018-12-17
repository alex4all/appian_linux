#include"e.h"
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

/*
 * Basic OS calls required by fork/save checkpointing.
 *
 * Compilation: gcc -shared -fPIC fork.c -o fs.so
 */

K callFork() {
 return gi(fork());
}

K callWaitpid(K pid) {
  if(pid->t!=1) {
    return kerr("pid must be an integer");
  }
  int status = 0;
  int options = WNOHANG;
  pid_t wpid = Ki(pid);   
  wpid = waitpid(wpid, &status, options); /* return 0 if not waiting, otherwise the pid */
#ifdef WCOREDUMP
  if(WIFSIGNALED(status)) {
    if(WCOREDUMP(status)) {
      return kerr("waitpid caught core dump in child process");
	}
  }
#endif
  return gi(wpid);
}
