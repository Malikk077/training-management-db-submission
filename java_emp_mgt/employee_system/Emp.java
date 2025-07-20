
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



class Read 
{
    public void read(String file){
        try
        {   
            FileReader fileReader=new FileReader(file);
            BufferedReader br =new BufferedReader(fileReader);
            String line;
            br.readLine();
            String header = br.readLine(); // two read line used bcoz one didnt work

            Net obj=new Net();
            obj.connect();
            while ((line=br.readLine()) != null)
                {
                    String[] values = line.split(",");
                    
                    obj.entry(values);

                } 
            obj.close();
        }


        catch (IOException e)
        {
            e.printStackTrace();
        }                 
        }
}
class Emp
{
    public static void main(String args[]) 
    {
        Read a=new Read();

        a.read("employees.csv");
    }
}


class Net
{
    
    private Connection con; //con can be set null if there is no connection in close fun()

    
    public void connect() {
            try {
            String url = "jdbc:mysql://localhost:3306/empl";
            String username = "root";
            String password = "#Ssfam123";
            con = DriverManager.getConnection(url, username, password);
            System.out.println("Connection successful");
        } catch (SQLException e) {
            System.out.println("Connection failed");
            e.printStackTrace();
        }
    }
    public void close() 
    {
        try {
            if (con != null && !con.isClosed()) {
                con.close();
                System.out.println("Connection closed");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void entry(String[] values)
    {
        int id;
        Double salary;
        java.sql.Date sqlDate;

    
        try {
            id = Integer.parseInt(values[0].trim());
        }
        catch (NumberFormatException e) {
            System.out.println("Invalid emp_id: " + values[0]);
            return;
        } //checking if data is valid .. 
        
        
        // avoid duplicate entry.
        try{
            String sq="select 1 from employees where emp_id = ?";
            PreparedStatement stmt = con.prepareStatement(sq);

            stmt.setInt(1,id);
            ResultSet res=stmt.executeQuery();
    
            if (res.next()) {
                System.out.println("Employee already exists.");
                return;

            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }

        if (values.length<8){
            System.out.println("incomplete set of data");
            return;
        }
        
        String firstName=values[1];
        String lastName=values[2];
        String email=values[3];
        String phone=values[4];
        String dept=values[5];
        
        
        try {
            salary = Double.parseDouble(values[6].trim());

        } 
        catch (NumberFormatException e) {
            System.out.println("Invalid salary: " + values[6]);
            return;
        }

        try 
        {
            sqlDate = java.sql.Date.valueOf(values[7].trim()); 
        }
        catch (IllegalArgumentException e) {
            System.out.println("Invalid date format (expected yyyy-mm-dd): " + values[7]);
            return;
        }//checking if date and salary are ilegal


    
        try {
           
            String sql = "INSERT INTO employees (emp_id,first_name,last_name,email,phone,department,salary,join_date) VALUES (?, ?, ?,?,?,?,?,?)";
            PreparedStatement stmt = con.prepareStatement(sql);

            stmt.setInt(1,id);
            stmt.setString(2, firstName);
            stmt.setString(3, lastName);
            stmt.setString(4, email);
            stmt.setString(5, phone);
            stmt.setString(6, dept);
            stmt.setDouble(7, salary);
            stmt.setDate(8, sqlDate);

            stmt.executeUpdate();
            

            stmt.close();
        } catch (SQLException e) {
            System.out.println("Failed");
            e.printStackTrace();
        }
    }
        

}
