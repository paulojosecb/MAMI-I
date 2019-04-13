class MEF {
  
  float martelando;
  int tempoParado;
  int tempoMartelando;
  
  MEF() {
    this.martelando = 0;
    this.tempoParado = 0;
    this.tempoMartelando = 0;
  }
  
  void update() {
     
    checkInput();
    
    if (this.martelando == 1) {
      this.tempoMartelando++;
      
      if (this.tempoMartelando >= 60) {
        this.tempoMartelando = 0;
        this.martelando = 0;
      }
    
    }
    
  }
  
  void checkInput() {
    
    if (keyPressed) {
  
      if (key == 'a') {
        mef.martelando = 1;
      }
    
    } 
    
  }

}
