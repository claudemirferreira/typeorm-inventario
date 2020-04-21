import {Entity, Column, PrimaryGeneratedColumn, ManyToOne, JoinColumn} from "typeorm";
import { Contagem } from "./contagem";

@Entity({name:"inv_lancamento"})
export class Lancamento {

    @PrimaryGeneratedColumn({name:"lanc_id"})
    id: number;

    @Column({length:100})
    observacao: string;

    @Column({ type: 'decimal', precision: 20, scale: 2, nullable:false})
    quantidade: number;

    @ManyToOne(type => Contagem, contagem => contagem.lancamentos)
    @JoinColumn({ name: "cont_id" })
    contagem: Contagem;
    
}
