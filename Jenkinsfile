node("master"){
  def String repo = 'git@github.com:tenna-llc/backend-crud.git'
  def String cloneto = 'be'
  def String self_repo = 'git@github.com:ten-peb/jenkins-backedcrud-qa.git'
  def String self_clone_to = 'jbq'
  def String staging = '/data/staging/backend'  
  def String image_name = "backend-web"
  def String image_tag = "0.5.0"
  stage ("Clone Repo") {
    sh('rm -rf ' + self_clone_to )  // clean before run
    sh('mkdir -vp ' $self_clone_to + '/backend/' + cloneto) 
     
     doGitClone(self_repo,self_clone_to)
     dir(self_clone_to + '/backend') {
        doGitClone(repo,cloneto,"development")
     }
  }
  stage("create image"){
    dir(self_clone_to + '/backend'){
      sh('docker build -t ' + image_name + ':' + image_tag + ' .')
      sh('docker build -t ' + image_name + ':' + 'latest' + ' .')
    }
  }
  stage ("notify qa"){
    sendEmail(qaTeam(),'New Docker Image published to QA Docker',
              image_name + ' was published from new content')
  }
  stage ("trigger container build"){
    build('BuildDockerContainers')
  }
  
}