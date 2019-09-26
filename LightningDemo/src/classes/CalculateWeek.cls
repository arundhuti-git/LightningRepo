//https://developer.salesforce.com/forums/?id=9060G000000I5urQAC

public class CalculateWeek {
    
	public integer estmHrs { get; set; }
    Public string selectedrole{get;set;}
    Public string selecedRno {get;set;}
    Public List<Selectoption> ResourcenoOption{set;}
    public List<SelectOption> ResourceroleOption{set;}
    public List<Selected_Rows_WC> sampRows{ get; set; }
    public Set<String> selected_vals{get;set;}
    public string wc_selected_rno{get;set;}
    public string wc_selected_role{get;set;}
    public integer wc_alcHrs { get; set; }
    public integer total_estmHrs { get; set; }
    
    
    public CalculateWeek(){
      estmHrs = integer.valueOf(ApexPages.currentPage().getParameters().get('totalHrs'));
      //estmHrs =  integer.valueOf(estmHrs);
      selected_vals = new Set<String>();
      sampRows = new list<Selected_Rows_WC>();
      total_estmHrs =0;
    }
    
    Public List<Selectoption> getResourceroleOption(){
        List<Selectoption> options = new List<selectoption>();
        options.add(new selectOption('- None -', '- None -'));
        options.add(new selectoption('Business Analyst','Business Analyst'));
        options.add(new selectoption('Consultant','Consultant'));
        options.add(new selectoption('Senior Consultant','Senior Consultant'));
        options.add(new selectoption('Manager','Manager'));
        options.add(new selectoption('Tester','Tester'));
        return options; 
    }
    
    Public List<Selectoption> getResourcenoOption(){
        List<Selectoption> options = new List<selectoption>();
        options.add(new selectOption('', '- None -'));
        for (integer i = 1; i <20; i++) {
            options.add(new selectOption(String.valueOf(i), String.valueOf(i)));
        }
        
        return options; 
    }
    
     public void addRows(){

         wc_selected_rno = this.selecedRno;
         wc_selected_role = this.selectedrole;
         wc_alcHrs = 40 * Integer.valueOf(this.selecedRno);
         Selected_Rows_WC ss = new Selected_Rows_WC(wc_selected_rno,wc_selected_role,wc_alcHrs);
         sampRows.add(ss);

         selected_vals.add(this.selecedRno);
         selected_vals.add(this.selectedrole);
         selected_vals.add(string.valueOf(wc_alcHrs));
         total_estmHrs = total_estmHrs + integer.valueOf(wc_alcHrs);
         //integer.valueOf(wc_alcHrs);

     }
    
     public class Selected_Rows_WC{
        public string wc_selected_rno{ get; set; }
        public string wc_selected_role{ get; set; }
        public integer wc_alcHrs{ get; set; }

        public Selected_Rows_WC(string str1,string str2,integer str3){
             this.wc_selected_rno = str1;
             this.wc_selected_role = str2;
             this.wc_alcHrs = str3;
  
        }
    }
//}
    
    
    
}