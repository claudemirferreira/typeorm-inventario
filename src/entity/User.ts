import { Perfil } from './Perfil';

import { Entity, Column, OneToMany, JoinColumn, Index, PrimaryGeneratedColumn, PrimaryColumn, ManyToOne, ManyToMany, JoinTable } from "typeorm";
import { Empresa } from "./Empresa";

@Entity({name:"inv_user"})
export class User {

    @PrimaryGeneratedColumn()
    codigo: number;

    @Column({length: 200, nullable: false})
    nome: String;

    @Column({length: 100, nullable: false})
    username: String;

    @Column({length: 100, nullable: false})
    password: String;

    @Column({nullable: false, default: true})
    active: Boolean;

    @ManyToOne(type => Empresa, empresa => empresa.users)
    empresa: Empresa;

    @ManyToMany(type => Perfil, {cascade: true})
    @JoinTable()
    perfis: Perfil[]
    
}