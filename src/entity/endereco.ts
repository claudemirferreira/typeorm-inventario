import {Entity, Column, PrimaryGeneratedColumn, JoinTable, ManyToMany, OneToMany, JoinColumn, ManyToOne} from "typeorm";
import { Contagem } from "./contagem";
import { Item } from "./item";

@Entity({name:"inv_endereco"})
export class Endereco {

    @PrimaryGeneratedColumn({name:"ende_id"})
    id: number;

    @Column({length:60, nullable:false})
    descricao: string;

    @Column({length:1, nullable:false})
    status: string;

    @ManyToOne(type => Item, item => item.enderecos)
    @JoinColumn({ name: "codigo" })
    item: Item;

    @OneToMany(type => Contagem, contagem => contagem.endereco)
    contagens: Contagem[];

}
