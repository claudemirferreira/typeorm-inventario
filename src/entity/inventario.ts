import {Entity, Column, PrimaryGeneratedColumn, JoinTable, ManyToMany, OneToMany} from "typeorm";
import { Contagem } from "./contagem";

@Entity({name:"inv_inventario"})
export class Inventario {

    @PrimaryGeneratedColumn({name:"inve_id"})
    id: number;

    @Column({nullable:false})
    data: Date;

    @Column({length:30, nullable:false})
    nome: string;

    @Column({length:1, nullable:false})
    status: string;

    @OneToMany(type => Contagem, contagem => contagem.inventario)
    contagens: Contagem[];

}
