/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Shivanshu Gupta
 */
import com.mongodb.*;
import java.net.UnknownHostException;


public class Connection {
    
    final String HOST="localhost";
    final int PORT=27017;
    final String DBNAME="Serve_me_database";
    public static Connection instance;
    public Mongo connection;
    public DB database;
    
    private Connection() throws UnknownHostException{
        this.connection=new Mongo(this.HOST,this.PORT);
        this.database=this.connection.getDB(this.DBNAME);
    }
    
    public static Connection createInstance() throws UnknownHostException{
        if(Connection.instance==null){
            Connection.instance=new Connection();
        }
        return Connection.instance;
    }
    
    public DBCollection getCollection(String name){
        return this.database.getCollection(name);
    }
    
    
    
}
