import { Entity, Column, PrimaryGeneratedColumn, OneToMany} from "typeorm";
import { Contagem } from "./contagem";
import { Execucao } from "./execucao";

@Entity({name:"inv_inventario"})
export class Inventario {

    @PrimaryGeneratedColumn({name:"inve_id"})
    id: number;

    @Column({nullable:false})
    data: Date;

    @Column({length:30, nullable:false})
    nome: string;

    @Column({ nullable:false})
    status: number;

    @OneToMany(type => Contagem, contagem => contagem.inventario)
    contagens: Contagem[];

    @OneToMany(type => Execucao, execucao => execucao.inventario)
    execucoes: Execucao[];

}
