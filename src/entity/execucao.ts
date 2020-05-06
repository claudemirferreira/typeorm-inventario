import { Inventario } from './inventario';
import { Entity, Column, PrimaryGeneratedColumn, JoinColumn, ManyToOne } from "typeorm";

@Entity({name:"inv_execucao"})
export class Execucao {

    @PrimaryGeneratedColumn({name:"exec_id"})
    id: number;

    @Column({nullable:true})
    inicio: Date;

    @Column({nullable:true})
    fim: Date;

    @Column({nullable:false})
    status: string;

    @Column({length:60, nullable:false})
    descricao: string;    

    @ManyToOne(type => Inventario, inventario => inventario.execucoes)
    @JoinColumn({ name: "inve_id" })
    inventario: Inventario;

}
