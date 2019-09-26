public class CalculateEstHrs {

    public Boolean hasSelCmp {get;set;}
    public Set<String> selCmpNames{get;set;}
    public Integer calculatedhrs{get;set;}
    Public List<Selectoption> ComponentCnt{set;}
    public string selectedcmpNo{get;set;}
    public string selectedcmpNoArr{get;set;}
    // Creating List for Wrapper class
    public List<wrapperCmp> LstwrapperCmp {get;set;}
    //Map<String, String> mapCmpCmplexity = new Map<String,String>();    
    
    // CONSTRUCTOR
    public CalculateEstHrs(){
        LstwrapperCmp = new List<wrapperCmp>();
        selCmpNames = new Set<String>();
        //myString ='';
        
        LstwrapperCmp.add(new wrapperCmp(0,'Approval Process','approval_process'));
        LstwrapperCmp.add(new wrapperCmp(1,'Process builder','process_builder'));
        LstwrapperCmp.add(new wrapperCmp(2,'Record Type','record_type'));
        LstwrapperCmp.add(new wrapperCmp(3,'Class/Controller','class_controller'));
        LstwrapperCmp.add(new wrapperCmp(4,'VisualForce Page','visualforce_page'));
        LstwrapperCmp.add(new wrapperCmp(5,'Work Flow','work_flow'));
        LstwrapperCmp.add(new wrapperCmp(6,'Trigger','trigger'));
    }
    
    Public List<Selectoption> getComponentCnt(){
        List<Selectoption> options = new List<selectoption>();
        options.add(new selectOption('', '- None -'));
        for (integer i = 1; i <=20; i++) {
            options.add(new selectOption(String.valueOf(i), String.valueOf(i)));
        }
        
        return options; 
    }
    /*public String[] convertStrToList(String str) {
    String[] listToReturn = new List<String>();
    if(String.isNotBlank(str)) {
        for(String eachStr : str.split(',')) {
            listToReturn.add(eachStr);
        }
    }
    return listToReturn;
    }  */ 
    
   
    
    // Wrapper Class Construction
    public class wrapperCmp{
        
        public Integer Id{get;set;}
        public String Name{get;set;}
        public String Component{get;set;}
        public String selectedComplexity {get;set;}
        public Boolean isSelected {get;set;}
        public String selectedcmpNo{get;set;}
        
        // Wrapper class constructor
        public wrapperCmp(Integer Id,String Name,String Component_type){
            this.Id=Id;
            this.Name=Name;
            this.Component = Component_type;
        }
    }
  
    public void checkSelectedValue(){  
        selCmpNames.clear();
        hasSelCmp = false;
        calculatedhrs = 0;
        
        
        for(wrapperCmp cWrapper : LstwrapperCmp){
            if(cWrapper.isSelected){
                hasSelCmp = true;
                selCmpNames.add(cWrapper.Name);
                selCmpNames.add(cWrapper.selectedcmpNo);
                
                for (Integer i = 1; i <= Integer.valueOf(cWrapper.selectedcmpNo); i++) {
                    selectedcmpNoArr = cWrapper.Name.replace(' ','_') + i +'_cmp_lvl_id';
                    //selCmpNames.add(selectedcmpNoArr);
                    selCmpNames.add(System.currentPagereference().getParameters().get(selectedcmpNoArr));
                    calculatedhrs = calculatedhrs + Integer.valueOf(System.currentPagereference().getParameters().get(selectedcmpNoArr)) ;
                }
				//selCmpNames.add(hasSelCmp);
                // Map of component and its complexity
                //mapCmpCmplexity.put(cWrapper.Name,cWrapper.selectedComplexity);
                
                //calculatedhrs = calculatedhrs + Integer.valueOf(cWrapper.selectedComplexity.trim()) ;
            }
            
        }   
    } 
    
    
    public PageReference calculateResource()
    {
        //Redirect to the calculate weeks page 
        PageReference pg= new PageReference('/apex/calculateweeks');
        pg.setRedirect(true);
        pg.getParameters().put('totalHrs',string.valueOf(calculatedhrs));
        return pg;
    }
}