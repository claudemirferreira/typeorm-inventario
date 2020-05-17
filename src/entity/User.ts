
import { Entity, Column, OneToMany, JoinColumn, Index, PrimaryGeneratedColumn, PrimaryColumn } from "typeorm";

@Entity({name:"inv_user"})
export class User {

    @PrimaryGeneratedColumn()
    codigo: String;

    @Column({length: 200, nullable: false})
    nome: String;

    @Column({length: 100, nullable: false})
    username: String;

    @Column({length: 100, nullable: false})
    password: String;

    @Column({nullable: false, default: true})
    active: Boolean;
    
}