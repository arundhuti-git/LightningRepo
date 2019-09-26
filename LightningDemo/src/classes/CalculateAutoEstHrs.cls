public class CalculateAutoEstHrs {

    //Start of old form functionality
    public Boolean hasSelCmp {get;set;}
    public Set<String> selCmpNames{get;set;}
    public Integer calculatedhrs{get;set;}
    Public List<Selectoption> ComponentCnt{set;}
    public List<wrapperCmp> LstwrapperCmp {get;set;}
    
    // CONSTRUCTOR
    public CalculateAutoEstHrs(){
        LstwrapperCmp = new List<wrapperCmp>();
        selCmpNames = new Set<String>();
        
        LstwrapperCmp.add(new wrapperCmp(0,'Approval Process',getItems(),getComponentCnt(),'','','',''));
        LstwrapperCmp.add(new wrapperCmp(1,'Process builder',getItems(),getComponentCnt(),'','','',''));
        LstwrapperCmp.add(new wrapperCmp(2,'Record Type',getItems(),getComponentCnt(),'','','',''));
        LstwrapperCmp.add(new wrapperCmp(3,'Class',getItems(),getComponentCnt(),'','','',''));
        LstwrapperCmp.add(new wrapperCmp(4,'VisualForce Page',getItems(),getComponentCnt(),'','','',''));
        LstwrapperCmp.add(new wrapperCmp(5,'Work Flow',getItems(),getComponentCnt(),'','','',''));
        LstwrapperCmp.add(new wrapperCmp(6,'Trigger',getItems(),getComponentCnt(),'','','',''));
    }
    
    
    
	
    public void checkSelectedValue(){
        
        selCmpNames.clear();
        hasSelCmp = false;
        calculatedhrs = 0;
        
        for(wrapperCmp cWrapper : LstwrapperCmp){

            if(cWrapper.isSelected){
                hasSelCmp = true;
                if(cWrapper.smplcmpNo !=null) calculatedhrs = calculatedhrs + (10 * integer.valueOf(cWrapper.smplcmpNo));
                if(cWrapper.mdcmpNo !=null) calculatedhrs = calculatedhrs + (20 * integer.valueOf(cWrapper.mdcmpNo));
                if(cWrapper.vcmpNo !=null) calculatedhrs = calculatedhrs + (30 * integer.valueOf(cWrapper.vcmpNo));
                if(cWrapper.vCcmpNo !=null) calculatedhrs = calculatedhrs + (40 * integer.valueOf(cWrapper.vCcmpNo));
            }
            system.debug('***Final calculatedhrs***'+ calculatedhrs +'***hasSelCmp***'+ hasSelCmp);
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
    
    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>(); 
        options.add(new SelectOption( '10','Simple')); 
        options.add(new SelectOption( '20','Medium')); 
        //options.add(new SelectOption( '30','Complex')); 
        //options.add(new SelectOption( '40','Very Complex')); 
        return options; 
    }
    
    Public List<Selectoption> getComponentCnt(){
        List<Selectoption> options = new List<selectoption>();
        options.add(new selectOption('', '- None -'));
        for (integer i = 1; i <=20; i++) {
            options.add(new selectOption(String.valueOf(i), String.valueOf(i)));
        }
        
        return options; 
    }
    
    // Wrapper Class Construction
    public class wrapperCmp{
        
        public Integer Id{get;set;}
        public String Name{get;set;}
        public List<SelectOption> Items{get;set;}
        Public List<Selectoption> ComponentCnt{get;set;}
        public Boolean isSelected {get;set;}
        public String smplcmpNo{get;set;}
        public String mdcmpNo{get;set;}
        public String vcmpNo{get;set;}
        public String vCcmpNo{get;set;}

        // Wrapper class constructor
        public wrapperCmp(Integer Id,String Name,List<SelectOption> Items,List<Selectoption> ComponentCnt,String smplcmpNo,String mdcmpNo,String vcmpNo,String vCcmpNo){ //,String Component_type
            this.Id=Id;
            this.Name=Name;
            this.smplcmpNo=smplcmpNo;
            this.mdcmpNo=mdcmpNo;
            this.vcmpNo=vcmpNo;
            this.vCcmpNo=vCcmpNo;
            this.Items = Items;
            this.ComponentCnt = ComponentCnt;
        }
    }
    
    
    
    
}