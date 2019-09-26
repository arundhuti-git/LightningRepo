//https://stackoverflow.com/questions/34849844/passing-multiple-radio-buttons-value-from-visual-force-page-to-controller?rq=1
//https://www.forcetalks.com/salesforce-topic/editing-a-record-from-selecting-list-of-record-using-radio-button/
//https://developer.salesforce.com/page/Wrapper_Class
//https://developer.salesforce.com/forums/?id=906F000000095lLIAQ
//https://medium.com/@ToAnshulVerma/salesforce-lightning-generate-pdf-from-lightning-components-with-in-memory-data-cd5dffe0fe25
//https://developer.salesforce.com/docs/atlas.en-us.pages.meta/pages/pages_output_pdf_print_as_pdf_button.htm
//https://developer.salesforce.com/forums/?id=906F000000091oMIAQ
public class CalculateHrs {
    
    public Boolean hasSelCmp {get;set;}
    public Set<String> selCmpNames{get;set;}
    public Integer calculatedhrs{get;set;}
    //public Boolean isDisabled{get;set;}
    Public List<Selectoption> ComponentCnt{set;}
    public string cmp_no{get;set;}
    public Integer selected_cmp_no{get;set;}
    
    // Creating List for Wrapper class
    public List<wrapperCmp> LstwrapperCmp {get;set;}
    Map<String, String> mapCmpCmplexity = new Map<String,String>();
    
    
    // CONSTRUCTOR
    public CalculateHrs(){
        LstwrapperCmp = new List<wrapperCmp>();
        selCmpNames = new Set<String>();
        selected_cmp_no =0;
        //isDisabled=true;
        
        LstwrapperCmp.add(new wrapperCmp(0,'Approval Process'));
        LstwrapperCmp.add(new wrapperCmp(1,'Process builder'));
        LstwrapperCmp.add(new wrapperCmp(2,'Record Type'));
        LstwrapperCmp.add(new wrapperCmp(3,'Class/Controller'));
        LstwrapperCmp.add(new wrapperCmp(4,'VisualForce Page'));
        LstwrapperCmp.add(new wrapperCmp(5,'Work Flow'));
        LstwrapperCmp.add(new wrapperCmp(6,'Trigger'));
    }
    
    /*public void visible(){
       isDisabled = false;
    }*/
    
    Public List<Selectoption> getComponentCnt(){
        List<Selectoption> options = new List<selectoption>();
        options.add(new selectOption('', '- None -'));
        for (integer i = 1; i <20; i++) {
            options.add(new selectOption(String.valueOf(i), String.valueOf(i)));
        }
        
        return options; 
    }
    
    
    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>(); 
        options.add(new SelectOption( '500','Simple')); 
        options.add(new SelectOption( '1000','Medium')); 
        options.add(new SelectOption( '1500','Complex')); 
        options.add(new SelectOption( '2000','Very Complex')); 
        return options; 
    }
    
    public String getcmp_no()
	{
    	return cmp_no;
    }
    
    public void setcmp_no(String cmp_no)
    {
        this.cmp_no = cmp_no;
    }
    
    public void getCmpNo(){
        system.debug('*********************');
        //selected_cmp_no = Integer.valueOf(this.cmp_no);
        system.debug('selected component no:'+this.cmp_no);
    }
    
    
    
    public void checkSelectedValue(){  
        selCmpNames.clear();
        hasSelCmp = false;
        calculatedhrs = 0;
        
        for(wrapperCmp cWrapper : LstwrapperCmp){
            if(cWrapper.isSelected){
                hasSelCmp = true;
                selCmpNames.add(cWrapper.Name);
                selCmpNames.add(cWrapper.selectedComplexity);

                // Map of component and its complexity
                mapCmpCmplexity.put(cWrapper.Name,cWrapper.selectedComplexity);
                
                /*set<string> keys = mapCmpCmplexity.keySet();
                for (string k:keys) {
                     ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,k +' : '+ mapCmpCmplexity.get(k)));  
                }*/
                
                calculatedhrs = calculatedhrs + Integer.valueOf(cWrapper.selectedComplexity.trim()) ;
                
                 
                
            }
            //system.debug('total hours' + calculatedhrs);
        }   
    } 

    // Wrapper Class Construction
    public class wrapperCmp{
        
        public Integer Id{get;set;}
        public String Name{get;set;}
        public String selectedComplexity {get;set;}
        public Boolean isSelected {get;set;}
        
        // Wrapper class constructor
        public wrapperCmp(Integer Id,String Name){
            this.Id=Id;
            this.Name=Name;
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