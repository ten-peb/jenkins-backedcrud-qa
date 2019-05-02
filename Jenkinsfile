node("master"){
  def String repo='git@github.com:tenna-llc/backend-crud.git'
  def String cloneto='backend-crud'
  
  stage("init"){
    doGetClone(repo,cloneto)
  }
  stage("build"){
  }
  stage("stage"){
    dir(cloneto){
      sh('rm -rf /data/stage/backend')
      sh('mkdir -vp /data/stage/backend')
      sh('cp -rp app /data/stage/backend/')
      sh('cp -rp config /data/stage/backend/')
      sh('cp package.json /data/stage/backend/')
    }
  }
  stage("notify qa"){
  }
  stage("trigger container build"){
  }
  
}