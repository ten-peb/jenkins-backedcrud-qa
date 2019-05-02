node("master"){
  def String repo = 'git@github.com:tenna-llc/backend-crud.git'
  def String cloneto = 'backend-crud'
  def String stage = '/data/staging/backend'  

  stage("init") {
    sh('rm -rf ' + cloneto)  /// clean before run
     doGitClone(repo,cloneto,"master")
  }
  stage("send to stage"){
    dir(cloneto){
      sh('rm -rf ' + stage + '/*')
      sh('cp -rp app ' + stage + '/')
      sh('cp -rp config ' + stage +'/')
      sh('cp package.json ' + stage +'/')
    }
  }
  stage("notify qa"){
  
  }
  stage("trigger container build"){
  
  }
  
}