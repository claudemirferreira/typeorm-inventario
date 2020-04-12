import {Entity, Column, PrimaryGeneratedColumn, JoinTable, ManyToMany, OneToMany} from "typeorm";
import { Contagem } from "./contagem";

@Entity()
export class Item {

    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    nome: string;

    @Column()
    codigoBarras: string;

    @Column()
    endereco: string;

    @Column()
    quantidadeSistema: number;

    @Column()
    quantidadeFisica: number;

    @OneToMany(type => Contagem, contagem => contagem.item)
    contagens: Contagem[];

}
