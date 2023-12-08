import { DataTypes, Model } from 'sequelize';
import util from 'util';
import connectToDB from './db.js';

const db = await connectToDB('postgresql:///animals');

export class Human extends Model {
  [util.inspect.custom]() {
    return this.toJSON();
  }
}
// TODO: Implement this method



// TODO: Human.init()
Human.init(
  {
    humanId:{
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false
    },
    fname: {
      type: DataTypes.STRING,
      allowNull: false
    },
    lname: {
      type: DataTypes.STRING,
      allowNull: false
    },
    email: {
      type: DataTypes.STRING,
      allowNull: false
    }
  },{
    sequelize: db
  }
  )
  
  
  
  export class Animal extends Model {
    [util.inspect.custom]() {
      return this.toJSON();
    }
  }
  
  // TODO: Animal.init()
  Animal.init(
    {
      animalId: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false
      },
      name:{
        type: DataTypes.STRING,
        allowNull: false 
      },
      species: {
        type: DataTypes.STRING,
        allowNull: false
      },
      birthYear: {
        type: DataTypes.INTEGER
      }
    },{
      sequelize: db
    }
    )
    Animal.hasOne(Human, {foreignKey: 'humanId'})
    Human.hasMany(Animal, {foreignKey: 'humanId'})
    export async function getFullName(){
     const emps = await Human.findAll()
     const all = emps.map((el) =>{
      return [el.fname, el.lname].join(" ")
    }
    )
    return emps;
     
    }
  
    // TODO: Define Relationship
    db.sync()
    export default db;
    