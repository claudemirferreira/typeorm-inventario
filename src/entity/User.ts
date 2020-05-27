
import { Entity, Column, OneToMany, JoinColumn, Index, PrimaryGeneratedColumn, PrimaryColumn, ManyToOne } from "typeorm";
import { Empresa } from "./Empresa";

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

    @ManyToOne(type => Empresa, empresa => empresa.users)
    @JoinColumn({ name: "empr_cnpj" })
    empresa: Empresa;
    
}