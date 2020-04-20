import {Entity, Column, PrimaryGeneratedColumn, JoinTable, ManyToMany, OneToMany} from "typeorm";
import { Contagem } from "./contagem";

@Entity()
export class ItemXls {

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    nome: string;

    @Column()
    codigo: string;

    @Column()
    unidade: string;

    @Column()
    endereco: string;

    @Column()
    boleto: string;

    @Column()
    quantidade: number;

}
