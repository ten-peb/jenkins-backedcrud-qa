node("master"){
  def String repo = 'git@github.com:tenna-llc/backend-crud.git'
  def String cloneto = 'backend-crud'
  def String staging = '/data/staging/backend'  

  stage ("Clone Repo") {
    sh('rm -rf ' + cloneto)  // clean before run
     doGitClone(repo,cloneto,"development")
  }
  stage ("send to stage"){
    def String[] confFiles=[
    'package.json','.docker.env.sample','.env.sample','.sequelizerc'
    ]
    dir(cloneto){
      sh('rm -rf ' + staging + '/*')
      sh('cp -rp app ' + staging + '/')
      sh('cp -rp test ' + staging + '/')
      for(String fname:confFiles){
        sh('cp ' + fname + ' ' + staging + '/')
      }
      
    }
  }
  stage ("notify qa"){
  
  }
  stage ("trigger container build"){
    build('BuildDockerContainers')
  }
  
}